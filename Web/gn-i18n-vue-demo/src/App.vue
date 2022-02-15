<template>
  <img alt="Vue logo" src="./assets/logo.png" />
  <HelloWorld msg="Welcome to Your Vue.js App" />
</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "App",
  components: {
    HelloWorld,
  },
  mounted() {
    window.setupWKWebViewJavascriptBridge((bridge) => {
      console.log(bridge);

      bridge.registerHandler(
        "testJavascriptHandler",
        function (data, responseCallback) {
          console.log("iOS called testJavascriptHandler with", data, "native");
          var responseData = { "Javascript Says": "Right back atcha!" };
          console.log("JS responding with", responseData, "native");
          responseCallback(responseData);
        }
      );

      bridge.callHandler(
        "testiOSCallback",
        { foo: "bar" },
        function (response) {
          console.log("JS got response", response, "js");
        }
      );
    });
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
