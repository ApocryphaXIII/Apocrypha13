# EMOTE_VOICES

Adds a character preference for selecting a voice style that changes the sounds played during emotes, along with a pitch preference for fine-tuning voice frequency. Originally made for TFN.

## Core files changed

- `modular_darkpack/master_files/code/datums/emotes.dm`: Overrides `/datum/emote/get_sound()` to check the human's `voicepack` var and return a pitched sound datum when a voicepack is set.

## Description

Players can select a voice pack and pitch value in the Vocals section of character preferences. When an emote plays a sound, it checks if the character has a voicepack assigned. If so, the voicepack is queried by the emote's key string. If a matching sound exists, it is returned as a `/sound` datum with the character's pitch applied. Emotes with no matching voicepack entry fall through to the default emote sound.

The default `Masculine` and `Feminine` packs use tgstation base sounds and work without any additional files. The `Haughty` pack for example can be made via copying the `sound/vo/` directory from Azure-Peak's repository that includes it. Of course, you can substitute for your own custom files.

## Adding new voice packs

1. Create a new subtype of `/datum/voicepack` in `code/voicepacks/`.
2. Override `get_sound(key)` with a switch block mapping emote key strings to sound file references or lists. Return `..()` at the end for fallback to a parent pack!!!! You need it to fallback or no sound will play!!
3. Add an entry to `GLOBAL_LIST_INIT(voicepack_list, ...)` in `code/__DEFINES/~darkpack/voicepack.dm`.
4. Ask your local host REALLY NICELY to add your files to the `darkpack_config/vo` folder. On your local fork, you will place files here to test them (making sure not to accidentally commit them to the repository!)

## Server-side Stuff

- The server end of things holds the files in the path of `darkpack_config/vo/` followed by male or female (or mobs for werewolf sounds), then the folder name.

For example, in the voicepack_list, there is an entry called `Noble II`.

This entry paths to the 'haughty' voicepack folder. The 'haughty' files are pathed to the server directory located at: `darkpack_config/vo/female/haughty`

## Credits

Voice system design ported from Azure-Peak, the sounds are credited to whomever you source them from. No sounds are included in this PR to avoid potential licensing issues; all sounds are (and should be) hosted on your individual server box to avoid violating your repository's license terms accidentally. It's just safer. -buffy
