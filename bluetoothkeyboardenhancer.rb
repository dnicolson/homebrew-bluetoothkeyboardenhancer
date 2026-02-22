class Bluetoothkeyboardenhancer < Formula
  desc "Enables the corner home button on an iOS keyboard to function as an escape key"
  homepage "https://github.com/dnicolson/BluetoothKeyboardEnhancer"
  url "https://github.com/dnicolson/BluetoothKeyboardEnhancer/archive/v0.4.0.zip"
  sha256 "b024791dbb18f738f3401e6619a53d41bd4ac02c2df16420c8d420f32c136494"

  def install
    system "clang -framework IOKit -framework Carbon BluetoothKeyboardEnhancer.c -o bke"
    bin.install "bke"
  end

  service do
    run [opt_bin/"bke"]
    keep_alive true
    run_at_load true
  end
end
