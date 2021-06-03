<template>
    <video width="100%" controls autoplay muted loop>
        <source src="//localhost:3000/api/video/getVideos/" type="video/mp4">
    </video>
</template>

<script>
export default {
  name: 'MainVideo'
}
</script>
