/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import { combineReducers } from 'redux';
import { TEST_COUNT_PLUS, TEST_COUNT_MINUS, } from '../actions/Actions';

const initialState = {
  count: 0
};

function countReducer(state = initialState, action) {
    switch (action.type) {
    case TEST_COUNT_PLUS:
        return {
            ...state,
            count: action.payload
        };
    case TEST_COUNT_MINUS:
        return {
            ...state,
            count: action.payload
        };
    default:
        return state;
    }
}

export default {
  countReducer,
};
