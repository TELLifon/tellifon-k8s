# tellifon.ch jitsi kubernetes configs

This repo includes customizations used to run jitsi on kubernetes for tellifon.ch

## jitsi-web image

The jitsi-web docker image is customized in order to show the tellifon.ch logo and other small customizations.

### Build

    make build


### Publish

    make release

The image will be default be pushed to the `tellifon` org on dockerhub, this can be configured via `PUBLISH_REPO` variable for make


## jitsi chart

We're using a helmchart to deploy jitsi into k8s.


### Install & Upgrade

    helm upgrade --install jitsi ./chart/jitsi --values values.yaml

see `values.yaml` for customizations that you might want