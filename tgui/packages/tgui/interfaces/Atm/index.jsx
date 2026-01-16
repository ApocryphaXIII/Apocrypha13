import { useBackend } from '../../backend';
import { Window } from '../../layouts';
import { AtmLogin } from './AtmLogin';
import { AtmMain } from './AtmMain';

export const Atm = (props) => {
  const { act, data } = useBackend();
  return (
    <Window width={500} height={500} theme="light">
      {data.logged_in ? (
        <AtmMain data={data} act={act} />
      ) : (
        <AtmLogin data={data} act={act} />
      )}
    </Window>
  );
};
