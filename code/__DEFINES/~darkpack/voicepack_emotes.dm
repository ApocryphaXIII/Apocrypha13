#define VO_SOUND_PATH "[global.config.directory]/darkpack_config/vo"

#define VOICE_PITCH_MIN 80
#define VOICE_PITCH_MAX 120
#define VOICE_PITCH_DEFAULT 100
#define VOICE_PITCH_VARIATION 8

GLOBAL_LIST_INIT(voicepack_list, list(
	"None" = null,
	"Masculine (M)" = /datum/voicepack/human/male,
	"Normal (M)" = /datum/voicepack/human/male/foppish,
	"Stern (M)" = /datum/voicepack/human/male/stern,
	"Warrior (M)" = /datum/voicepack/human/male/warrior,
	"Knightly (M)" = /datum/voicepack/human/male/knight,
	"Dignified (M)" = /datum/voicepack/human/male/elf,
	"Bearded (M)" = /datum/voicepack/human/male/dwarf,
	"Odd (M)" = /datum/voicepack/human/male/goblin,
	"Evil (M)" = /datum/voicepack/human/male/evil,
	"Old (M)" = /datum/voicepack/human/male/wizard,
	"Stoner (M)" = /datum/voicepack/human/male/jester,
	"Deep Voice (M)" = /datum/voicepack/human/male/zeth,
	"Feminine (F)" = /datum/voicepack/human/female,
	"Noble (F)" = /datum/voicepack/human/female/haughty,
	"Noble II (F)" = /datum/voicepack/human/female/warrior,
	"Dainty (F)" = /datum/voicepack/human/female/dainty,
	"Dignified (F)" = /datum/voicepack/human/female/elf,
	"Rough (F)" = /datum/voicepack/human/female/dwarf,
	"Odd (F)" = /datum/voicepack/human/female/goblin,
))
