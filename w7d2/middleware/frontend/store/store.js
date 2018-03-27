import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch, otherMiddleware, otherOtherMiddleware)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  // console.log('step 1');
  console.log(action);
  // console.log('step 2');
  next(action);
  console.log(store.getState());
  // console.log('step 3');
};

const otherMiddleware = store => next => action => {
  console.log('test 1');
  next(action);
};

const otherOtherMiddleware = store => next => action => {
  console.log('test 2');
  next(action);
};

export default configureStore;
