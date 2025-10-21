<template>
  <div class="p-8 max-w-3xl mx-auto">
    <h1 class="text-2xl font-bold mb-6 text-gray-800">🔥 熱門商品排行榜</h1>

    <!-- 載入資料按鈕 -->
    <button
      @click="loadData"
      class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition cursor-pointer"
    >
      載入資料
    </button>

    <!-- 載入中提示 -->
    <div v-if="loading" class="mt-4 text-gray-500">載入中...</div>

    <!-- 顯示資料 -->
    <ul v-if="!loading && products.length" class="mt-6 space-y-2">
      <li
        v-for="item in products"
        :key="item.id"
        class="border p-3 rounded shadow-sm hover:shadow-md transition"
      >
        <div class="flex justify-between items-center">
          <div>
            <strong>{{ item.name }}</strong>
            <span class="text-gray-500 text-sm ml-2">({{ item.category }})</span>
          </div>
          <div>
            <span class="font-semibold text-blue-600">{{ item.sales }} 銷售</span>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { getTrendingProducts } from "./api";

const products = ref<any[]>([]);
const loading = ref(false);

async function loadData() {
  loading.value = true;
  try {
    products.value = await getTrendingProducts();
  } catch (error) {
    console.error("API error:", error);
  } finally {
    loading.value = false;
  }
}
</script>
