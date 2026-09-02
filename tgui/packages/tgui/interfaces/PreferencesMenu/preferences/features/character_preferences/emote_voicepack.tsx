// THIS IS A DARKPACK UI FILE
import { useBackend } from 'tgui/backend';
import { Button, Stack } from 'tgui-core/components';
import {
  type FeatureChoiced,
  type FeatureChoicedServerData,
  type FeatureNumeric,
  FeatureSliderInput,
  type FeatureValueProps,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

const FeatureVoicepackDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData>,
) => {
  const { act } = useBackend();

  return (
    <Stack>
      <Stack.Item grow>
        <FeatureDropdownInput {...props} />
      </Stack.Item>
      <Stack.Item>
        <Button
          onClick={() => {
            act('preview_voicepack');
          }}
          icon="play"
          width="100%"
          height="100%"
        />
      </Stack.Item>
    </Stack>
  );
};

export const emote_voicepack: FeatureChoiced = {
  name: 'Emote Voice Pack',
  component: FeatureVoicepackDropdownInput,
};

export const emote_voice_pitch: FeatureNumeric = {
  name: 'Emote Voice Pitch %',
  description: 'Be sure to test out your voice after making changes!',
  component: FeatureSliderInput,
};
