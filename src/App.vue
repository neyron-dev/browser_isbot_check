<template>
 
    <div id="check" :loaded="loaded" :data-is-bot="isBot">{{ result }}</div>
 
</template>

<script>
import FingerprintJS from '@fingerprintjs/fingerprintjs-pro'

export default {
  name: 'App',
  data() {
    return {
      result: 'Loading...',
      isBot: false,
      loaded: false
    }
  },
  async mounted() {
    try {
      const fp = await FingerprintJS.load({ 
        apiKey: import.meta.env.VITE_FINGERPRINT_API_KEY
      });

      const result = await fp.get();
      const response = await fetch(`https://eu.api.fpjs.io/events/${result.requestId}`, {
        headers: {
          "Auth-API-Key": import.meta.env.VITE_FINGERPRINT_SERVER_KEY
        }
      });

      if (!response.ok) {
        throw new Error("Request failed");
      }

      const apiData = await response.json();
      this.isBot = (
        apiData?.products?.botd?.data?.result !== "notDetected" ||
        apiData?.products?.locationSpoofing?.result !== false ||
        (apiData?.products?.suspectScore?.result > 1)
      );

      this.result = JSON.stringify(apiData, null, 2);
    } catch (error) {
      console.error('Error:', error);
      this.isBot = true;
      this.result = JSON.stringify({
        error: error.message
      }, null, 2);
    }

    this.loaded = true;
  }
}
</script>

<style>
.container {
  font-family: Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

#check {
  text-align: left;
  background: #f5f5f5;
  padding: 15px;
  border-radius: 4px;
  max-width: 800px;
  margin: 0 auto;
  overflow-x: auto;
  white-space: pre-wrap;
  word-wrap: break-word;
}
</style> 
