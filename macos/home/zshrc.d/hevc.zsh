hevc() {
        for file in $*
        do
                vcodec=libx265
                acodec=aac
                out=$(ffmpeg -i "$file" 2>&1)
                if [[ $out =~ 'Video: hevc' ]]; then
                        vcodec=copy
                fi
                if [[ $out =~ 'Audio: aac' ]]; then
                        acodec=copy
                fi
                if [[ $vcodec = copy && $acodec = copy ]]; then
                        echo "$file: Nothing to transcode"
                        continue
                fi
                ffmpeg -i "$file" -vcodec $vcodec -acodec $acodec -tag:v hvc1 "$file-hevc.mp4"
        done
}

