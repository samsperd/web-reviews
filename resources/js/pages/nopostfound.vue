<template>
    <div class="container text-center">
        <v-icon x-large>mdi-delete-empty-outline</v-icon>
        <h3 v-if="term != null">Found Nothing on <dt class="font-italic">{{term}}</dt> in the location</h3>
        <h3 v-else>Found Nothing in the location</h3>

        <v-btn color="primary" dark>Go Back</v-btn>
    </div>

</template>
<script>
export default {
    props: ['term']
}
</script>