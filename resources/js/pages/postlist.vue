<template>
    <div>
          <h4 class="text-capitalize col-12 font-weight-bold">The Best {{categoryName}} online businesses in {{location}}</h4>
              <v-divider></v-divider>
                <v-card
                class="text-decoration-none"
                flat
              >
                  <v-list-item class="grow" :href="'/business/'+post.slug">
                    <v-list-item-avatar color="grey darken-3">
                      <v-img
                        class="elevation-6"
                        alt=""
                        :src="'/storage/'+post.image"
                      ></v-img>
                    </v-list-item-avatar>

                    <v-list-item-content>
                      <v-list-item-title style="white-space: normal !important;" v-text="post.title"></v-list-item-title>
                  <span class="text-muted small">
                    <template v-for="(category, index) in post.category">
                      <template v-if="index > 0">
                        ,
                      </template>
                      <span :key="index">{{category.name}}</span>
                    </template>

                    
                  </span>
                    </v-list-item-content>
                    <v-row
                      align="center"
                      justify="end"
                    >
                    <v-icon>mdi-map-marker</v-icon>
                    {{post.location.location}}
                    </v-row>
                  </v-list-item>
                <v-card-text class="col-12">
                  <v-row
                    align="center"
                    class="mx-0"
                  >
                    <v-rating
                      :value="post.rate"
                      color="amber"
                      dense
                      half-increments
                      readonly
                      size="14"
                    ></v-rating>

                    <div class="grey--text ml-4">
                      4.5 (1)
                    </div>
                  </v-row>
                </v-card-text>
                <v-card-subtitle>
                  {{post.excerpt}}
                </v-card-subtitle>
                <v-card-actions>
                <v-row
                justify="end"
                >
                  <v-btn 
                color="success lighten-2"
                large
                v-if="post.company_number"
                :href="'tel:'+post.company_number"
                  icon>
                    <v-icon color="dark">mdi-phone-outgoing-outline</v-icon>
                  </v-btn>
                  <v-btn 
                color="success lighten-3"
                large
                v-if="post.company_email"
                :href="'mailto:'+post.company_email"
                target="blank"
                  icon>
                    <v-icon color="dark">mdi-email-outline</v-icon>
                  </v-btn>
                  <v-btn 
                color="deep-purple lighten-2"
                large
                v-if="post.instagram"
                target="blank"
                :href="'https://www.instagram.com/'+post.instagram"    
                  icon>
                    <v-icon color="pink darken-1">mdi-instagram</v-icon>
                  </v-btn>
                  <v-btn 
                color="deep-purple lighten-2"
                  icon
                  large
                  target="blank"
                v-if="post.twitter"
                :href="'https://www.twitter.com/'+post.twitter"    
                  
                  >
                    <v-icon color="light-blue lighten-3">mdi-twitter</v-icon>
                  </v-btn>
                  <v-btn icon large target="blank" :href="'https://www.facebook.com/'+post.facebook">
                    <v-icon color="indigo">mdi-facebook</v-icon>

                  </v-btn>
                  <v-btn 
                color="success"
                large
                v-if="post.whatsapp"
                :href="post.whatsapp"
                target="blank"
                  icon>
                    <v-icon color="dark">mdi-whatsapp</v-icon>
                    
                  </v-btn>

                </v-row>


                </v-card-actions>
              </v-card>
              <v-divider></v-divider>

            <!-- <template v-if="( index < searched.length, index < limitList)">
              <v-card
                class="text-decoration-none"
                flat
              >
                  <v-list-item class="grow" :href="'/business/'+post.slug">
                    <v-list-item-avatar color="grey darken-3">
                      <v-img
                        class="elevation-6"
                        alt=""
                        :src="'/storage/'+post.image"
                      ></v-img>
                    </v-list-item-avatar>

                    <v-list-item-content>
                      <v-list-item-title style="white-space: normal !important;" v-text="post.title"></v-list-item-title>
                  <span class="text-muted small">
                    <template v-for="(category, index) in post.category">
                      <template v-if="index > 0">
                        ,
                      </template>
                      <span :key="index">{{category.name}}</span>
                    </template>

                    
                  </span>
                    </v-list-item-content>
                    <v-row
                      align="center"
                      justify="end"
                    >
                    <v-icon>mdi-map-marker</v-icon>
                    {{post.location.location}}
                    </v-row>
                  </v-list-item>
                <v-card-text class="col-12">
                  <v-row
                    align="center"
                    class="mx-0"
                  >
                    <v-rating
                      :value="post.rate"
                      color="amber"
                      dense
                      half-increments
                      readonly
                      size="14"
                    ></v-rating>

                    <div class="grey--text ml-4">
                      4.5 (1)
                    </div>
                  </v-row>
                </v-card-text>
                <v-card-subtitle>
                  {{post.excerpt}}
                </v-card-subtitle>
                <v-card-actions>
                <v-row
                justify="end"
                >
                  <v-btn 
                color="success lighten-2"
                large
                v-if="post.company_number"
                :href="'tel:'+post.company_number"
                  icon>
                    <v-icon color="dark">mdi-phone-outgoing-outline</v-icon>
                  </v-btn>
                  <v-btn 
                color="success lighten-3"
                large
                v-if="post.company_email"
                :href="'mailto:'+post.company_email"
                target="blank"
                  icon>
                    <v-icon color="dark">mdi-email-outline</v-icon>
                  </v-btn>
                  <v-btn 
                color="deep-purple lighten-2"
                large
                v-if="post.instagram"
                target="blank"
                :href="'https://www.instagram.com/'+post.instagram"    
                  icon>
                    <v-icon color="pink darken-1">mdi-instagram</v-icon>
                  </v-btn>
                  <v-btn 
                color="deep-purple lighten-2"
                  icon
                  large
                  target="blank"
                v-if="post.twitter"
                :href="'https://www.twitter.com/'+post.twitter"    
                  
                  >
                    <v-icon color="light-blue lighten-3">mdi-twitter</v-icon>
                  </v-btn>
                  <v-btn icon large target="blank" :href="'https://www.facebook.com/'+post.facebook">
                    <v-icon color="indigo">mdi-facebook</v-icon>

                  </v-btn>
                  <v-btn 
                color="success"
                large
                v-if="post.whatsapp"
                :href="post.whatsapp"
                target="blank"
                  icon>
                    <v-icon color="dark">mdi-whatsapp</v-icon>
                    
                  </v-btn>

                </v-row>


                </v-card-actions>
              </v-card>
              <v-divider></v-divider>
            </template> -->
    </div>
</template>
<script>
export default {
  props: ['post', 'categoryName', 'location'],
}
</script>