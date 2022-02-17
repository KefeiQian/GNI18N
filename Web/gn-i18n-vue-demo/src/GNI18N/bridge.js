const GNI18NJSBridge = {
  call(bridgeName, params, callback) {
    if (!window.bridge) {
      const t = setInterval(() => {
        if (!window.bridge) return;
        window.bridge.callHandler(bridgeName, params, callback);
        clearInterval(t);
      }, 100);
      return;
    }
    window.bridge.callHandler(bridgeName, params, callback);
  },
  register(bridgeName, callback) {
    if (!window.bridge) {
      const t = setInterval(() => {
        if (!window.bridge) return;
        window.bridge.registerHandler(bridgeName, callback);
        clearInterval(t);
      }, 100);
      return;
    }
    window.bridge.registerHandler(bridgeName, callback);
  },
};

export default GNI18NJSBridge;
