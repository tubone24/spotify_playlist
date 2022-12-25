terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_track" "projection" {
  url = "https://open.spotify.com/track/2p5YDGZegSA90zYPiwU4v3?si=ee3dfa3a34644547"
}

data "spotify_track" "dive_into_the_light" {
  url = "https://open.spotify.com/track/49E7VAH8J4pSjaQgV1jamk?si=0804256f3feb4acc"
}

data "spotify_track" "ray" {
  url = "https://open.spotify.com/track/4U26q0oBh53yYTDfiY9GXu?si=b04ddaf374a64dc1"
}


resource "spotify_playlist" "playlist" {
  name        = "My Playlist"
  description = "This playlist was created by Terraform"
  public      = false

  tracks = [
    data.spotify_track.projection.id,
    data.spotify_track.dive_into_the_light.id,
    data.spotify_track.ray.id
  ]
}
