#!/bin/bash

# Paprašoma vartotojo nurodyti šaltinio katalogą, kurį reikia atsarginiai kopijuoti
read -p "Įveskite katalogą, kurį norite kopijuoti: " SOURCE_DIR

# Patikrinama, ar šaltinio katalogas egzistuoja
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Katalogas $SOURCE_DIR neegzistuoja. Išeinama."
    exit 1
fi

# Apibrėžiamas atsarginės kopijos katalogas ir dabartinė data
BACKUP_DIR="../backup"
CURRENT_DATE=$(date +"%Y-%m-%d")

# Sukuriamas atsarginės kopijos katalogas, jei jis neegzistuoja
if [ ! -d "$BACKUP_DIR" ]; then
    sudo mkdir -p "$BACKUP_DIR"
    sudo chmod -R 755 "$BACKUP_DIR"
    echo "Atsarginės kopijos katalogas sukurtas adresu $BACKUP_DIR"
else
    echo "Atsarginės kopijos katalogas jau egzistuoja adresu $BACKUP_DIR"
fi

# Sukuriamas pakatalogis dabartinei datai, jei jis neegzistuoja
SUBDIR="$BACKUP_DIR/$CURRENT_DATE"
if [ ! -d "$SUBDIR" ]; then
    sudo mkdir -p "$SUBDIR"
    sudo chmod -R 755 "$SUBDIR"
    echo "Pakatalogis sukurtas datai $CURRENT_DATE"
else
    echo "Pakatalogis datai $CURRENT_DATE jau egzistuoja"
fi

# Kopijuojami visi failai iš šaltinio katalogo į atsarginės kopijos pakatalogį
for FILE in "$SOURCE_DIR"/*; do
    sudo cp -r "$FILE" "$SUBDIR/"
    echo "Kopijuota $FILE į $SUBDIR/"
done

# Išspausdinama užbaigimo žinutė
echo "Katalogo $SOURCE_DIR atsarginė kopija sėkmingai sukurta"
