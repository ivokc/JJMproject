/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import TestContainer from '../../pages/TestContainer';
import OtherContainer from '../../pages/OtherContainer';
import FormPage from '../../pages/FormPage'
export default {
  TestContainer: {
    RootView: {
      screen: TestContainer,
    },
    OtherContainer: {
      screen: OtherContainer,
    },
    FormPage:{
      screen:FormPage
    }

  },
};
