class Bluetoothkeyboardenhancer < Formula
  desc "Enables the corner home button on an iOS keyboard to function as an escape key"
  homepage "https://github.com/dnicolson/BluetoothKeyboardEnhancer"
  url "https://github.com/dnicolson/BluetoothKeyboardEnhancer/archive/v0.4.0.zip"
  sha256 "b024791dbb18f738f3401e6619a53d41bd4ac02c2df16420c8d420f32c136494"

  def install
    system "clang -framework IOKit -framework Carbon BluetoothKeyboardEnhancer.c -o bke"
    bin.install "bke"
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
        <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/bke</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end
