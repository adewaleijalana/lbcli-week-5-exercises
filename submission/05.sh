# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

publicKeyHash=$(echo -n $publicKey | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p -c 32)


parts=("029600" "b2" "75" "76" "a9" "14" "$publicKeyHash" "88" "ac")

redeem_script=""
for part in "${parts[@]}"; do
  redeem_script+="$part"
done

echo $redeem_script
