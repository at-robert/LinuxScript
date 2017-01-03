if [ "$#" -lt 1 ]; then
	echo "Usage: diff_matrix_TWN_SB.sh [in PATH]"
	exit -1
fi

DIR=$1
OUTPATH=$DIR/DIFF
TARGET_PATH=$DIR/Target

if [ -f $DIR/AC3/ac3-standard.h ] && [ -f $DIR/AC3/ac3-movie.h ] && [ -f $DIR/AC3/ac3-music.h ] && [ -f $DIR/AC3/ac3-news.h ];
then
    echo "=========[AC3 files check OK]==========="
else
    echo "=== AC3 files missing ==="
    exit;
fi

if [ -f $DIR/pcm/standard-160201.h ] && [ -f $DIR/pcm/movie-160201.h ] && [ -f $DIR/pcm/music-160201.h ] && [ -f $DIR/pcm/news-160201.h ];
then
    echo "=========[PCM files check OK]==========="
else
    echo "=== PCM files missing ==="
    exit;
fi

printf "#ifndef __AC3_MOVIE_H__\n#define __AC3_MOVIE_H__\n\nstatic const uint32 code AC3_MOVIE [] = /* AC3 - MOVIE */\n{\n" > $DIR/AC3/ac3_movie.h
diff $DIR/AC3/ac3-standard.h $DIR/AC3/ac3-movie.h  | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' >> $DIR/AC3/ac3_movie.h
printf "};\n#endif /*__AC3_MOVIE_H__*/\n" >> $DIR/AC3/ac3_movie.h

printf "#ifndef __AC3_MUSIC_H__\n#define __AC3_MUSIC_H__\n\nstatic const uint32 code AC3_MUSIC [] = /* AC3 - MUSIC */\n{\n" > $DIR/AC3/ac3_music.h
diff $DIR/AC3/ac3-standard.h $DIR/AC3/ac3-music.h  | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' >> $DIR/AC3/ac3_music.h
printf "};\n#endif /*__AC3_MUSIC_H__*/\n" >> $DIR/AC3/ac3_music.h

printf "#ifndef __AC3_NEWS_H__\n#define __AC3_NEWS_H__\n\nstatic const uint32 code AC3_NEWS [] = /* AC3 - NEWS */\n{\n" > $DIR/AC3/ac3_news.h
diff $DIR/AC3/ac3-standard.h $DIR/AC3/ac3-news.h  | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' >> $DIR/AC3/ac3_news.h
printf "};\n#endif /*__AC3_NEWS_H__*/\n" >> $DIR/AC3/ac3_news.h
sync


printf "#ifndef PCM_MOVIE_H__\n#define PCM_51_MOVIE_H__\n\nstatic const uint32 code PCM_MOVIE[] = /* PCM -MOVIE */\n{\n" > $DIR/pcm/pcm_movie.h
diff $DIR/pcm/standard-160201.h $DIR/pcm/movie-160201.h | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' >> $DIR/pcm/pcm_movie.h
printf "};\n#endif" >>  $DIR/pcm/pcm_movie.h
sync

printf "#ifndef PCM_MUSIC_H__\n#define PCM_MUSIC_H__\n\nstatic const uint32 code PCM_MUSIC[] = /* PCM - MUSIC */\n{\n" > $DIR/pcm/pcm_music.h
diff $DIR/pcm/standard-160201.h $DIR/pcm/music-160201.h | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' >> $DIR/pcm/pcm_music.h
printf "};\n#endif" >>  $DIR/pcm/pcm_music.h
sync

printf "#ifndef PCM_NEWS_H__\n#define PCM_NEWS_H__\n\nstatic const uint32 code PCM_NEWS[] = /* PCM - NEWS */\n{\n" > $DIR/pcm/pcm_news.h
diff $DIR/pcm/standard-160201.h $DIR/pcm/news-160201.h | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' >> $DIR/pcm/pcm_news.h
printf "};\n#endif" >>  $DIR/pcm/pcm_news.h
sync

if [ -d $OUTPATH ];
then
		echo "================================"
		echo "Outpath exists so that deleting it ........"
		echo "================================"
		rm -rf $OUTPATH
else
	echo "================================"
fi

mkdir $OUTPATH
mv $DIR/AC3/ac3_movie.h $OUTPATH
mv $DIR/AC3/ac3_music.h $OUTPATH
mv $DIR/AC3/ac3_news.h $OUTPATH
mv $DIR/pcm/pcm_movie.h $OUTPATH
mv $DIR/pcm/pcm_music.h $OUTPATH
mv $DIR/pcm/pcm_news.h $OUTPATH

if [ -d $TARGET_PATH ];
then
		echo "================================"
		echo "Target exists so that copying it ........"
		echo "================================"
		cp -fv $OUTPATH/ac3_movie.h $TARGET_PATH
		cp -fv $OUTPATH/ac3_music.h $TARGET_PATH
		cp -fv $OUTPATH/ac3_news.h  $TARGET_PATH
		cp -fv $OUTPATH/pcm_movie.h $TARGET_PATH
		cp -fv $OUTPATH/pcm_music.h $TARGET_PATH
		cp -fv $OUTPATH/pcm_news.h  $TARGET_PATH
else
	echo "======No Target folder found so copy them manually =========================="
fi