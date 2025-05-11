#!/bin/bash
# Array of Coldplay's top 20 songs
songs=(
    "Yellow" "Viva La Vida" "The Scientist" "Clocks" "Fix You"
    "Paradise" "Something Just Like This" "A Sky Full of Stars"
    "Hymn for the Weekend" "Adventure of a Lifetime" "In My Place"
    "Speed of Sound" "Trouble" "Shiver" "Dont Panic" "Green Eyes"
    "Hurts Like Heaven" "Violet Hill" "My Universe" "Sparks"
)

echo "Coldplay's Top 20 Songs:"
for i in "${!songs[@]}"; do
    echo "$((i+1)). ${songs[i]}"
done

read -p "Choose a song number (1-20): " choice
if [[ ! $choice =~ ^[1-9][0-9]?$ || $choice -gt 20 ]]; then
    echo "Invalid choice. Exiting."
    exit 1
fi

song=${songs[$((choice-1))]}
echo "You chose: $song"

# YouTube URLs (manually curated)
declare -A youtube_urls=(
    ["Yellow"]="https://www.youtube.com/watch?v=yKNxeF4KMsY"
    ["Viva La Vida"]="https://www.youtube.com/watch?v=dvgZkm1xWPE"
    ["The Scientist"]="https://www.youtube.com/watch?v=RB-RcX5DS5A"
    ["Clocks"]="https://www.youtube.com/watch?v=d020hcWA_Wg"
    ["Fix You"]="https://www.youtube.com/watch?v=k4V3Mo61fJM"
    ["Paradise"]="https://www.youtube.com/watch?v=1G4isv_Fylg"
    ["Something Just Like This"]="https://www.youtube.com/watch?v=FM7MFYoylVs"
    ["A Sky Full of Stars"]="https://www.youtube.com/watch?v=VPRjCeoBqrI"
    ["Hymn for the Weekend"]="https://www.youtube.com/watch?v=YykjpeuMNEk"
    ["Adventure of a Lifetime"]="https://www.youtube.com/watch?v=QtXby3twMmI"
    ["In My Place"]="https://www.youtube.com/watch?v=gnIZ7RMuLpU"
    ["Speed of Sound"]="https://www.youtube.com/watch?v=0k_1kvDh2UA"
    ["Trouble"]="https://www.youtube.com/watch?v=kcASPx3zP7A"
    ["Shiver"]="https://www.youtube.com/watch?v=2sc_2wDPEp0"
    ["Dont Panic"]="https://www.youtube.com/watch?v=yWeFz1N90aI"
    ["Green Eyes"]="https://www.youtube.com/watch?v=0zC-P3xTSrM"
    ["Hurts Like Heaven"]="https://www.youtube.com/watch?v=C8KV0mzqElE"
    ["Violet Hill"]="https://www.youtube.com/watch?v=IakDItZ7f7Q"
    ["My Universe"]="https://www.youtube.com/watch?v=3YqPKLZF_WU"
    ["Sparks"]="https://www.youtube.com/watch?v=3Z7Zx-nXK3U"
)

# Open YouTube video in Chrome
echo "Opening $song in Google Chrome..."
/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe "${youtube_urls[$song]}" &

# Record voice for 30 seconds
echo "Recording your voice for 30 seconds (sing along!)..."
ffmpeg -f alsa -i default -t 30 "recording.wav" -y

# Prompt for SoundCloud upload
echo "Recording saved as recording.wav"
echo "Please upload recording.wav to SoundCloud at https://soundcloud.com/upload"
echo "After uploading, play the track from your SoundCloud profile."
read -p "Press Enter to exit..."
