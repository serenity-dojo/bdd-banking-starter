// features/step_definitions/notifications.steps.js

const { Given, When, Then, Before } = require('@cucumber/cucumber');
const assert = require('assert');
const notificationService = require('../../src/notificationService');

Before(() => {
  notificationService.reset();
});

Given('Connie has a registered PayID of {string}', function (payId) {
  notificationService.setPayID(payId);
});

Given('Connie has selected the following notification preferences:', function (dataTable) {
  const preferences = dataTable.raw().slice(1).map(row => row[0]); // skip header
  notificationService.setPreferences(preferences);
});

Given('she updates her preferences to:', function (dataTable) {
  const preferences = dataTable.raw().slice(1).map(row => row[0]);
  notificationService.setPreferences(preferences);
});

When('Connie receives a payment via PayID:', function (dataTable) {
  const payment = dataTable.hashes()[0];
  notificationService.receivePayment(payment);
});

Then('Connie should be notified with:', function (dataTable) {
  const expected = dataTable.hashes(); // array of { Method, Message }
  const actual = notificationService.getNotifications();

  assert.deepStrictEqual(actual, expected);
});
