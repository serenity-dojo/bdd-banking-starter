// src/notificationService.js

let registeredPayID = null;
let preferences = [];
let notifications = [];

module.exports = {
  setPayID: (payId) => {
    registeredPayID = payId;
  },

  setPreferences: (prefs) => {
    preferences = [...prefs];
  },

  receivePayment: ({ From, Amount }) => {
    notifications = preferences.map(method => {
      let message;

      // Customize message format per channel
      if (method === 'Email') {
        message = `You've received a payment of ${Amount} from ${From} to your PayID (${registeredPayID}).`;
      } else if (method === 'Push') {
        message = `Payment received: ${Amount} from ${From} to your PayID ${registeredPayID}.`;
      } else {
        message = `You've received ${Amount} from ${From} to your PayID ${registeredPayID}.`;
      }

      return {
        Method: method,
        Message: message
      };
    });
  },

  getNotifications: () => {
    return [...notifications];
  },

  reset: () => {
    registeredPayID = null;
    preferences = [];
    notifications = [];
  }
};
