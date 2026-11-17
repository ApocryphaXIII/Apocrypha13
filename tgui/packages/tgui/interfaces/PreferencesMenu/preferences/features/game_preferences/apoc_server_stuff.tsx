import {
  CheckboxInput,
  type FeatureToggle,
} from '../base';

export const avoid_admin_kick: FeatureToggle = {
  name: 'Bypass afk disconnect',
  category: 'ADMIN',
  description:
    'Avoids you from being disconnected from round shutdown or afk checks.',
  component: CheckboxInput,
};
