<template>
  <CommonModal v-model:opened="qrCodeModalOpened" title="QR Decoding Error">
    <CommonErrorBlock :retry-button="false">{{ qrDecodeErrorMessage }}</CommonErrorBlock>

    <CommonButton
      as="label"
      for="qr-code-input"
      variant="primary-solid"
      class="mx-auto mt-6"
      @click="qrCodeModalOpened = false"
    >
      Try again
    </CommonButton>
  </CommonModal>
  <CommonQrInput :id="id" class="sr-only" @decoded="onQrCodeDecoded" @error="onQrDecodeError" />
</template>

<script lang="ts" setup>
import { ref } from "vue";

import { isAddress } from "ethers/lib/utils";

import { checksumAddress } from "@/utils/formatters";

defineProps({
  id: {
    type: String,
  },
});

const emit = defineEmits<{
  (eventName: "selected", address: string): void;
}>();

const qrDecodeErrorMessage = ref<string>();
const qrCodeModalOpened = ref(false);
const onQrDecodeError = (message: string) => {
  qrDecodeErrorMessage.value = message;
  qrCodeModalOpened.value = true;
};
const onQrCodeDecoded = (data: string) => {
  if (isAddress(data)) {
    emit("selected", checksumAddress(data));
  } else {
    onQrDecodeError("QR code doesn't contain a valid ethereum address");
  }
};
</script>
