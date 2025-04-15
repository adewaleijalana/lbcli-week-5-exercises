# Create a CLTV script with a timestamp of 1495584032 and public key below:
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

publicKeyHash=$(echo -n $publicKey | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p -c 32)

parts=("0420cd2459" "b1" "75" "76" "a9" "14" "$publicKeyHash" "88" "ac")

redeem_script=""
for part in "${parts[@]}"; do
  redeem_script+="$part"
done

echo $redeem_script

