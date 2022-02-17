import GNI18NJSBridge from "./bridge";

const GNI18N = {
  CONSTANTS: {
    CHANGE_LANGUAGE_NATIVE_BRIDGE_NAME: "changeLanguageNative",
    CHANGE_LANGUAGE_WEB_BRIDGE_NAME: "changeLanguageWeb",
    GET_NATIVE_LANG_BRIDGE_NAME: "getNativeLanguage",
  },
  LANGUAGE: {
    CHINESE: { name: "中文", value: "zh-Hans" },
    ENGLISH: { name: "English", value: "en" },
    JAPANESE: { name: "日本語", value: "ja" },
  },
  changeLanguage(lang) {
    GNI18NJSBridge.call(
      this.CONSTANTS.CHANGE_LANGUAGE_WEB_BRIDGE_NAME,
      { lang },
      (response) => {
        console.log(response);
      }
    );
  },
};

export default GNI18N;
