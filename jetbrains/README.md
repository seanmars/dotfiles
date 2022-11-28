# JetBrains Settings

## Editor > File And Code Templates

### Vue

- Vue SFC With setup
  - Extension: `vue`
  - Reformate according to sytle: `true`
  - Enable Live Templates: `true`

```vue
<template>
    #[[$END$]]#
</template>

<script setup lang="ts">
interface Props {
}

const props = withDefaults(defineProps<Props>(),
  {},
);
</script>

<style scoped>

</style>
```
