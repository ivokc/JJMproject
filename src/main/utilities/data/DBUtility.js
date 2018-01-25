/**
 * Created by MeePwn
 * https://github.com/maybewaityou
 *
 * description:
 *
 */
import * as Realm from 'realm';
import JSONUtility from './JSONUtility';

/* 筛选条件 */
const criteria = {
  id: 'string',
};

/* 存储类型格式 */
const JSONSchema = {
  name: 'JSON',
  primaryKey: 'id',
  properties: {
    ...criteria,
    data: 'string',
  },
};

export const DBUtility = {

  add(data) {
    return new Promise((resolve, reject) => {
      Realm.open({ schema: [ JSONSchema ] })
        .then((realm) => {
          realm.write(() => {
            const item = realm.create('JSON', {
              id: data.id,
              data: JSONUtility.toString(data),
            });
            resolve(item);
          });
        })
        .catch((error) => {
          reject(error);
        });
    });
  },

  update(queryCriteria, data) {
    return new Promise((resolve, reject) => {
      Realm.open({ schema: [ JSONSchema ] })
        .then((realm) => {
          realm.write(() => {
            const item = realm.objects('JSON').filtered(`id = '${queryCriteria.id}'`);
            item['0'].data = JSONUtility.toString(data);
            resolve(item);
          });
        })
        .catch((error) => {
          reject(error);
        });
    });
  },

  query(queryCriteria: ICriteria) {
    return new Promise((resolve, reject) => {
      Realm.open({ schema: [ JSONSchema ] })
        .then((realm) => {
          realm.write(() => {
            resolve(realm.objects('JSON').filtered(`id = '${queryCriteria.id}'`));
          });
        })
        .catch((error) => {
          reject(error);
        });
    });
  },

  queryAll() {
    return new Promise((resolve, reject) => {
      Realm.open({ schema: [ JSONSchema ] })
        .then((realm) => {
          realm.write(() => {
            resolve(realm.objects('JSON'));
          });
        })
        .catch((error) => {
          reject(error);
        });
    });
  },

  delete(queryCriteria: ICriteria) {
    return new Promise((resolve, reject) => {
      Realm.open({ schema: [ JSONSchema ] })
        .then((realm) => {
          realm.write(() => {
            const item = realm.objects('JSON').filtered(`id = '${queryCriteria.id}'`);
            realm.delete(item);
            resolve(true);
          });
        })
        .catch((error) => {
          reject(error);
        });
    });
  },

  deleteAll() {
    return new Promise((resolve, reject) => {
      Realm.open({ schema: [ JSONSchema ] })
        .then((realm) => {
          realm.write(() => {
            realm.deleteAll();
            resolve(true);
          });
        })
        .catch((error) => {
          reject(error);
        });
    });
  },

};
