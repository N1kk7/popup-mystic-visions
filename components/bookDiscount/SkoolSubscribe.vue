<template>

    <div class="subscription_wrapper">
        <div class="options_card">
            <div class="option_head">
                <h1>
                    Choose the book options
                </h1>

                
            </div>
            <div class="option_items">
                    <div 
                        class="option_item"
                        v-for="option in items"
                        :key="option.id"
                        :class="activeOption.id === option.id && 'active_option'"
                        @click="activeOption.id = option.id; activeOption.bookSelected = option.bookSelected; activeOption.variantId = option.variantId"
                    >

                        <img :src="`./images/${option.media}`" alt="option_image">

                        <div class="option_item_content">
                            <div class="option_text_content">
                                <h2>
                                    {{ option.title }}
                                </h2>
                                <span>
                                    {{ option.subTitle }}
                                </span>

                            </div>
                            

                            <div class="price_block">
                                <span class="price">
                                    ${{ option.price }}
                                </span>
                                <span class="discount">
                                    ${{ (Number(option.price) - (Number(option.price) * Number(option.discountSize || 0) / 100)).toFixed(2) }}
                                </span>
                            </div>
                        </div>

                    </div>

            </div>

        </div>
        <div class="note">

            <div class="note_text_block">
              
                <span>
                    <strong>
                        Note:
                    </strong>
                    Use the
                    <strong>
                        same email
                    </strong>
                    on Empyrean signup so your personal discount link is sent after your trial begins.


                </span>

            </div>

            <div class="user_data">
                <div class="modelValue_group">
                    <input
                        type="email"
                        v-model="dataValues.email"
                        @focus="focused.email = true, touched.email = true"
                        @blur="touched.email = true"
                        @input="emailValidation"
                    />
                    <label :class="{ active: focused.email || dataValues.email }"
                        >Email</label
                    >
                    <span class="error" v-if="errors.email">{{ errors.email }}</span>
                </div>


                <div class="modelValue_group">
                    <input
                        type="text"
                        v-model="dataValues.userName"
                        @focus="focused.userName = true, touched.userName = true"
                        @blur="touched.userName = true"
                        @input="nameValidation"
                    />

                    <label :class="{ active: focused.userName || dataValues.userName }"
                        >Name</label
                    >
                    <span class="error" v-if="errors.userName">{{ errors.userName }}</span>
                </div>

            </div>
            
            
        </div>
    </div>

</template>



<script setup lang="ts">

import { ref, onMounted, watch } from "vue";

interface BookData {
    userName: string;
    email: string;
    variantId: string
}

const activeOption = ref(
    {
        id: 1,
        bookSelected: '',
        variantId: ''
    }
);

const touched = reactive({
  email: false,
  userName: false,
});

const dataValues = reactive<BookData>({
    userName: '',
    email: '',
    variantId: activeOption.value.variantId
})

const emit = defineEmits<{
    (e: "update:modelValue", value: BookData): void;
    (e: "update:valid", value: boolean): void;
}>();

watch(dataValues, (val) => emit("update:modelValue", {...val}),
    { deep: true }
);
watch(() => activeOption.value.variantId, val => dataValues.variantId = val, { immediate: true });

const errors = reactive({
  email: "",
  userName: "",
});

const focused = reactive({
  email: false,
  userName: false,
});

const nameValidation = (): boolean => {
  if (!touched.userName) return false;
  if (!dataValues.userName || dataValues.userName.length < 2) {
    errors.userName = "The name should be at least 2 characters";
    return false;
  } else {
    errors.userName = "";
    return true;
  }
};

const emailValidation = (): boolean => {
    if (!touched.email) return false;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(dataValues.email)) {
        errors.email = "Enter correct email";
        return false;
    } else {
        errors.email = "";
        return true;
    }
};

const items = ref([
    {
        id: 1,
        title: "Deluxe Edition - (Hardcover)",
        subTitle: "Premium finish, collectible quality.",
        variantId: "49305684803752",
        price: 34.99,
        discountSize: 50,
        bookSelected: 'HARD_COVER',
        media: "hardcover-option1.webp",
        itemDescription: "Description of hard cover",
    },
    {
        id: 2,
        title: "Trade Paperback",
        subTitle: "Lightweight, travel-ready.",
        variantId: "53919430508712",
        price: 19.99,
        discountSize: 50,
        bookSelected: 'SOFT_COVER',
        media: "softcover-option.webp",
        itemDescription: "Description of hard cover",
    }
])

const isFormValid = computed(() => {
  return (
    nameValidation() &&
    emailValidation()
  );
});




watch(isFormValid, (val) => {
  emit("update:valid", val);
});



onMounted(() => {

    activeOption.value.variantId = items.value[0].variantId

})


</script>




<style lang="scss" scoped>

    .subscription_wrapper{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        padding-block: 20px;
        margin: auto 0;
        gap: 2em;
        width: 80%;

        @media screen and (max-width: 1024px) {
            & {
            width: 95%;
            }
        }
        @media screen and (max-width: 768px) {
            & {
            flex-direction: column;
            justify-content: flex-start;
            gap: 0;
            height: 100%;
            overflow-y: scroll;
            padding-bottom: 2em;
            }
        }

        @media screen and (max-width: 375px) {
            &{
                width: 100%;
            }
            
        }

    }

    .options_card, .note{
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        position: relative;
        gap: 1.5em;
        

    }



    .options_card{
        width: 100%;
        @media screen and (max-width: 768px) {
            &{
                gap: 1.5em;
                width: 100%;
            }
        }
    }

    .note{
        width: 100%;
        height: auto;
        color: var(--text-color);
        @media screen and (max-width: 768px) {
            &{
                margin-top: 2em;
                width: 95%;
            }
        }
    }

    h1,h2{
        font-size: 1.2rem;
        font-weight: 600;
        color: var(--text-color);
       
    }

    p{
        font-weight: 400;
        font-size: 0.9rem;
    }

    .option_items{
        display: flex;
        justify-content: flex-start;
        align-items: stretch;
        width: 100%;
        gap: 2em;

        @media screen and (max-width: 1024px) {
            &{
               gap: 1.5em
            }
        }

        @media screen and (max-width: 768px) {
            &{
                 flex-direction: column;
                justify-content: flex-start;
                align-items: flex-start;
                gap: 1em;
                width: 100%
            }
        }
    }

    .option_item{
        display: flex;
        justify-content: flex-start;
        align-items: stretch;
        border: 1px solid rgba(0, 0, 0, 0.05);
        border-radius: 16px;
        background: #ffffff;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); 
        flex: 1;
        gap: 1rem;
        padding: 1em;
        filter: grayscale(100%);
        transition: all ease 0.15s;
        opacity: 0.6;
        position: relative;
        cursor: pointer;
        img{
            width: 100px;
            height: auto;
            border-radius: 5px;
            aspect-ratio: 1;
            object-fit: contain;

        }

        @media screen and (min-width: 1024px) {
            &:hover{
                opacity: 1;
                transition: all ease 0.15s;

            }
            
        }

        @media screen and (max-width: 1024px) {

           &{
                gap: 1em;
                width: -webkit-fill-available;
            }
            
        }

        @media screen and (max-width: 400px) {
            &{
                width: 95%;
                padding: 0.5em;
                gap: 0.7em;
            }
        }
    }

    .active_option{
        filter: none;
        opacity: 1;
        transition: all ease 0.15s;
        border: 1px solid rgba(#480074, 0.2);
    }

    .option_item_content{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: flex-start;
        width: -webkit-fill-available;
        // flex: 1;
        gap: 1em;
        h2{
            font-size: clamp(0.8rem, 1.5vw, 1.2rem);
            font-weight: 700;
            color: var(--text-color);
            @media screen and (max-width: 1024px) {
                &{
                    font-size: clamp(0.9rem, 1.5vw, 1.2rem);
                }
            }
            @media screen and (max-width: 768px) {
                &{
                    font-size: 1.2rem;
                }
            }
            @media screen and (max-width: 550px) {
                &{
                    font-size: clamp(0.70rem, 4.5vw, 1rem);

                }
            }
            @media screen and (max-width: 420px) {
                &{
                    font-size: clamp(0.60rem, 4vw, 1.2rem);
                
            }
            }
        }
        span{
            font-weight: 500;
            font-size: 0.8rem;
            line-height: normal;
            color: #333;
            @media screen and (max-width: 1024px) {
                &{
                    font-size: clamp(0.7rem, 1.5vw, 0.9rem);
                }
            }
            @media screen and (max-width: 768px) {
                &{
                    font-size: 0.9rem;
                }
            }
            @media screen and (max-width: 550px) {
                &{
                    font-size: clamp(0.70rem, 4.5vw, 0.8rem);
                }
            }
        }

        .price_block{
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
            gap: 0.5rem;
            filter: none;
            opacity: 1;

            .price{
                color: red ;
                text-decoration: line-through;
                font-weight: 400;
                z-index: 1;
            }

            .discount{
                color: green;
                font-weight: 600;

            }
        }
    }

    .modelValue_group {
        position: relative;
        width: 100%;
    }

    .note_text_block{
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: flex-start;
        gap: 0.5rem;

        @media screen and (max-width: 768px) {
            &{
                gap: 1rem;
            }
        }
    }

    .user_data{
        width: 100%;
        height: auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 1rem;
        & {
            @media screen and (max-width: 768px) {
                &{
                    flex-direction: column;
                    justify-content: flex-start;
                    align-items: flex-start;
                    gap: 1.7rem;
                }
            }
        }
    }

input[type="email"],
input[type="text"] {
  width: 100%;
  padding: 12px 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 6px;
  outline: none;
}

label {
  position: absolute;
  left: 12px;
  top: 12px;
  color: #888;
  pointer-events: none;
  transition: 0.2s ease all;
}

label.active {
  top: -8px;
  left: 8px;
  font-size: 12px;
  background: white;
  padding: 0 4px;
  color: #333;
}

.error {
  position: absolute;
  left: 0;
  bottom: -20px;
  color: red;
  font-size: 12px;
  margin-top: 4px;
}


</style>

