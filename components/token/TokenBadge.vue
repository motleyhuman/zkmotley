<template>
  <div class="token-badge">
    <div class="token-badge-amount">{{ parseTokenAmount(amount, token.decimals) }} {{ token.symbol }}</div>
  </div>
</template>

<script lang="ts" setup>
import type { PropType } from "vue";

defineProps({
  amount: {
    type: String,
    required: true,
  },
  token: {
    type: Object as PropType<{
      decimals: number;
      symbol: string;
    }>,
    required: true,
  },
});
</script>

<style lang="scss">
.token-badge {
  @apply rounded-2xl bg-gray-200/50 p-1 px-2 dark:bg-neutral-800;
}
</style>
