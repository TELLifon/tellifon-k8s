{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "jitsi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jitsi.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "jitsi.web.fullname" -}}
{{- printf "%s-%s" (include "jitsi.fullname" .) .Values.web.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "jitsi.prosody.fullname" -}}
{{- printf "%s-%s" (include "jitsi.fullname" .) .Values.prosody.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "jitsi.jicofo.fullname" -}}
{{- printf "%s-%s" (include "jitsi.fullname" .) .Values.jicofo.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "jitsi.jvb.fullname" -}}
{{- printf "%s-%s" (include "jitsi.fullname" .) .Values.jvb.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "jitsi.jibri.fullname" -}}
{{- printf "%s-%s" (include "jitsi.fullname" .) .Values.jibri.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jitsi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "jitsi.labels" -}}
helm.sh/chart: {{ include "jitsi.chart" . }}
{{ include "jitsi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "jitsi.web.labels" -}}
{{ include "jitsi.labels" . }}
{{ include "jitsi.web.selectorLabels" . }}
{{- end -}}

{{- define "jitsi.prosody.labels" -}}
{{ include "jitsi.labels" . }}
{{ include "jitsi.prosody.selectorLabels" . }}
{{- end -}}

{{- define "jitsi.jicofo.labels" -}}
{{ include "jitsi.labels" . }}
{{ include "jitsi.jicofo.selectorLabels" . }}
{{- end -}}

{{- define "jitsi.jvb.labels" -}}
{{ include "jitsi.labels" . }}
{{ include "jitsi.jvb.selectorLabels" . }}
{{- end -}}

{{- define "jitsi.jibri.labels" -}}
{{ include "jitsi.labels" . }}
{{ include "jitsi.jibri.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "jitsi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jitsi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "jitsi.web.selectorLabels" -}}
{{ include "jitsi.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.web.name }}
{{- end -}}

{{- define "jitsi.prosody.selectorLabels" -}}
{{ include "jitsi.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.prosody.name }}
{{- end -}}

{{- define "jitsi.jicofo.selectorLabels" -}}
{{ include "jitsi.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.jicofo.name }}
{{- end -}}

{{- define "jitsi.jvb.selectorLabels" -}}
{{ include "jitsi.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.jvb.name }}
{{- end -}}

{{- define "jitsi.jibri.selectorLabels" -}}
{{ include "jitsi.selectorLabels" . }}
app.kubernetes.io/component: {{ .Values.jibri.name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "jitsi.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "jitsi.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
