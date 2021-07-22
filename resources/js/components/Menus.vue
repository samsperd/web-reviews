<template>
            <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="url"
        
      >
        <v-icon
        large
        :color="colour"
        >{{iconn}}</v-icon>

        <v-card-text>
          {{title}}
        </v-card-text>

      </v-card>
    </v-col>

</template>
<script>
export default {
    props: ['title', 'iconn', 'url', 'colour']
}
</script>