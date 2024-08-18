import Foundation
import Accelerate

let signalLength = 1024
var realParts = [Float](repeating: 0.0, count: signalLength)
var imaginaryParts = [Float](repeating: 0.0, count: signalLength)

// Example: Fill the real part with a sine wave
let frequency: Float = 50.0
let sampleRate: Float = 1000.0
for i in 0..<signalLength {
    realParts[i] = sin(2.0 * Float.pi * frequency * Float(i) / sampleRate)
}

let log2n = vDSP_Length(log2(Float(signalLength)))
let fftSetup = vDSP_create_fftsetup(log2n, FFTRadix(FFT_RADIX2))!

realParts.withUnsafeMutableBufferPointer { realPtr in
    imaginaryParts.withUnsafeMutableBufferPointer { imagPtr in
        var splitComplex = DSPSplitComplex(realp: realPtr.baseAddress!, imagp: imagPtr.baseAddress!)
        vDSP_fft_zip(fftSetup, &splitComplex, 1, log2n, FFTDirection(FFT_FORWARD))

        // Compute magnitudes
        var magnitudes = [Float](repeating: 0.0, count: signalLength)
        vDSP_zvmags(&splitComplex, 1, &magnitudes, 1, vDSP_Length(signalLength))

        // Output magnitudes to stdout
        for magnitude in magnitudes.prefix(signalLength / 2) {
            print(magnitude)
        }
    }
}

vDSP_destroy_fftsetup(fftSetup)
