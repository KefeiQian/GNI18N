import App from "./App.vue";
import GNI18N from "./GNI18N/index";
import { createApp } from "vue";
import { createI18n } from "vue-i18n";

const messages = {
  [GNI18N.LANGUAGE.ENGLISH.value]: {
    message: {
      changeLanguage: "change language",
    },
  },
  [GNI18N.LANGUAGE.JAPANESE.value]: {
    message: {
      changeLanguage: "言葉を変わる",
    },
  },
  [GNI18N.LANGUAGE.CHINESE.value]: {
    message: {
      changeLanguage: "更改语言",
    },
  },
};

// 2. Create i18n instance with options
const i18n = createI18n({
  locale: GNI18N.LANGUAGE.JAPANESE.value, // set locale
  fallbackLocale: GNI18N.LANGUAGE.CHINESE.value, // set fallback locale
  messages, // set locale messages
  // If you need to specify other options, you can set other options
  // ...
});

// 3. Create a vue root instance
const app = createApp(App);

// 4. Install i18n instance to make the whole app i18n-aware
app.use(i18n);

app.mount("#app");
