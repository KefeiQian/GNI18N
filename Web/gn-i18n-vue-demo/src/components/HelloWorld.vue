<template>
  <div class="hello">
    <button @click="changeLanguage">
      <p>{{ $t("message.changeLanguage") }}</p>
    </button>
  </div>
</template>

<script>
import GNI18N from "../GNI18N/index";

export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  mounted() {},
  methods: {
    changeLanguage() {
      let currentLanguage = this.$i18n.locale;
      const langList = Object.keys(GNI18N.LANGUAGE);
      do {
        currentLanguage =
          GNI18N.LANGUAGE[
            langList[Math.floor(Math.random() * langList.length)]
          ];
      } while (currentLanguage.value == this.$i18n.locale);

      this.$i18n.locale = currentLanguage.value;

      GNI18N.changeLanguage(currentLanguage.value);
    },
  },
};
</script>

<style scoped>
.hello {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
button {
  width: 100px;
  height: 100px;
  font-size: 16px;
}
</style>
