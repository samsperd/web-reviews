<template>
    <wrapper>
        <div>
                <v-card class="mt-2">
                    <v-card-title v-html="term.title">
                        
                    </v-card-title>
                    <v-card-text v-html="term.body">
                        
                    </v-card-text>
                </v-card>
        </div>
    </wrapper>
</template>
<script>
import Wrapper from '..//layouts/default'
export default {
    components: {Wrapper},
    data() {
        return {
            term: '',
        }
    },
    created(){
        this.getTerms();
    },
    methods: {
        getTerms() {
            axios.get('/api/terms')
                .then((response)=>{
                    this.term = response.data.term;
                }).catch(err => {
                    // alert('Please Reload');
                    // location.reload();

                });    

        },
    },
    
}
</script>
