#!/bin/bash

# Skaičių spėjimo žaidimas

# Generuojamas atsitiktinis skaičius tarp 1 ir 100
target=$(( RANDOM % 100 + 1 ))

# Inicializuojami kintamieji
spėjimas=0
bandymai=0

echo "Sveiki atvykę į Skaičių Spėjimo Žaidimą!"
echo "Aš pasirinkau skaičių tarp 1 ir 100. Ar galite jį atspėti?"

# Ciklas, kol vartotojas atspės teisingą skaičių
while [ $spėjimas -ne $target ]; do
    # Nuskaitomas vartotojo įvestis
    read -p "Įveskite savo spėjimą: " spėjimas

    # Padidinamas bandymų skaitiklis
    bandymai=$(( bandymai + 1 ))

    # Patikrinama, ar spėjimas teisingas
    if [ $spėjimas -lt $target ]; then
        echo "Per mažas! Bandykite dar kartą."
    elif [ $spėjimas -gt $target ]; then
        echo "Per didelis! Bandykite dar kartą."
    else
        echo "Sveikiname! Jūs atspėjote teisingą skaičių per $bandymai bandymus."
    fi
done
