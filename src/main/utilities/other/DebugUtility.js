/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
const DebugUtility = {

    log(...params) {
        if (Constant.isDebug) {
            console.log(...params);
        }
    }

};

export default DebugUtility;
