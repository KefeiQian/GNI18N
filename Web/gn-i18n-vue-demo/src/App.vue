<template>
  <HelloWorld />
</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";
import GNI18NJSBridge from "./GNI18N/bridge";
import GNI18N from "./GNI18N/index";

export default {
  name: "App",
  components: {
    HelloWorld,
  },
  mounted() {
    GNI18NJSBridge.register(
      GNI18N.CONSTANTS.CHANGE_LANGUAGE_NATIVE_BRIDGE_NAME,
      (data, responseCallback) => {
        const { lang } = data;
        this.$i18n.locale = lang;

        responseCallback(`web change language to ${lang}`);
      }
    );

    GNI18NJSBridge.call(
      GNI18N.CONSTANTS.GET_NATIVE_LANG_BRIDGE_NAME,
      {},
      (lang) => {
        this.$i18n.locale = lang;
      }
    );
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
