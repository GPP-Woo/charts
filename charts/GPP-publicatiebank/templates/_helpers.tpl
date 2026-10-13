{{/*
Expand the name gpp-publicatiebank the chart.
*/}}
{{- define "gpp-publicatiebank.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gpp-publicatiebank.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gpp-publicatiebank.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "gpp-publicatiebank.commonLabels" -}}
helm.sh/chart: {{ include "gpp-publicatiebank.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
gpp-publicatiebank labels
*/}}
{{- define "gpp-publicatiebank.labels" -}}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{ include "gpp-publicatiebank.commonLabels" . }}
{{ include "gpp-publicatiebank.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "gpp-publicatiebank.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-publicatiebank.name" . }}
{{- end }}

{{/*
Create a name for the worker
We truncate at 56 chars in order to provide space for the "-worker" suffix
*/}}
{{- define "gpp-publicatiebank.workerName" -}}
{{ include "gpp-publicatiebank.name" . | trunc 56 | trimSuffix "-" }}-worker
{{- end }}

{{/*
Create a default fully qualified name for the worker.
We truncate at 56 chars in order to provide space for the "-worker" suffix
*/}}
{{- define "gpp-publicatiebank.workerFullname" -}}
{{ include "gpp-publicatiebank.fullname" . | trunc 56 | trimSuffix "-" }}-worker
{{- end }}

{{/*
Worker labels
*/}}
{{- define "gpp-publicatiebank.workerLabels" -}}
{{ include "gpp-publicatiebank.commonLabels" . }}
{{ include "gpp-publicatiebank.workerSelectorLabels" . }}
{{- end }}

{{/*
Worker selector labels
*/}}
{{- define "gpp-publicatiebank.workerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-publicatiebank.workerName" . }}
{{- end }}

{{/*
Create a name for Celery beat
We truncate at 58 chars in order to provide space for the "-beat" suffix
*/}}
{{- define "gpp-publicatiebank.beatName" -}}
{{ include "gpp-publicatiebank.name" . | trunc 58 | trimSuffix "-" }}-beat
{{- end }}

{{/*
Create a default fully qualified name for Celery beat.
We truncate at 58 chars in order to provide space for the "-beat" suffix
*/}}
{{- define "gpp-publicatiebank.beatFullname" -}}
{{ include "gpp-publicatiebank.fullname" . | trunc 58 | trimSuffix "-" }}-beat
{{- end }}

{{/*
Celery beat labels
*/}}
{{- define "gpp-publicatiebank.beatLabels" -}}
{{ include "gpp-publicatiebank.commonLabels" . }}
{{ include "gpp-publicatiebank.beatSelectorLabels" . }}
{{- end }}

{{/*
Celery beat selector labels
*/}}
{{- define "gpp-publicatiebank.beatSelectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-publicatiebank.beatName" . }}
{{- end }}

{{/*
Create a name for Flower
We truncate at 56 chars in order to provide space for the "-flower" suffix
*/}}
{{- define "gpp-publicatiebank.flowerName" -}}
{{ include "gpp-publicatiebank.name" . | trunc 56 | trimSuffix "-" }}-flower
{{- end }}

{{/*
Create a default fully qualified name for Flower.
We truncate at 56 chars in order to provide space for the "-flower" suffix
*/}}
{{- define "gpp-publicatiebank.flowerFullname" -}}
{{ include "gpp-publicatiebank.fullname" . | trunc 56 | trimSuffix "-" }}-flower
{{- end }}

{{/*
Flower labels
*/}}
{{- define "gpp-publicatiebank.flowerLabels" -}}
{{ include "gpp-publicatiebank.commonLabels" . }}
{{ include "gpp-publicatiebank.flowerSelectorLabels" . }}
{{- end }}

{{/*
Flower selector labels
*/}}
{{- define "gpp-publicatiebank.flowerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-publicatiebank.flowerName" . }}
{{- end  }}

{{/*
Create the name of the service account to use
*/}}
{{- define "gpp-publicatiebank.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "gpp-publicatiebank.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Ingress annotations
*/}}
{{- define "gpp-publicatiebank.ingress.annotations" -}}
  {{- range $key, $val := .Values.ingress.annotations }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
{{- end }}

{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "gpp-publicatiebank.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "gpp-publicatiebank.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{/*
Create a name for NGINX
We truncate at 57 chars in order to provide space for the "-nginx" suffix
*/}}
{{- define "gpp-publicatiebank.nginxName" -}}
{{ include "gpp-publicatiebank.name" . | trunc 57 | trimSuffix "-" }}-nginx
{{- end }}

{{/*
Create a default fully qualified name for NGINX.
We truncate at 57 chars in order to provide space for the "-nginx" suffix
*/}}
{{- define "gpp-publicatiebank.nginxFullname" -}}
{{ include "gpp-publicatiebank.fullname" . | trunc 57 | trimSuffix "-" }}-nginx
{{- end }}

{{/*
NGINX labels
*/}}
{{- define "gpp-publicatiebank.nginxLabels" -}}
{{ include "gpp-publicatiebank.commonLabels" . }}
{{ include "gpp-publicatiebank.nginxSelectorLabels" . }}
{{- end }}

{{/*
NGINX selector labels
*/}}
{{- define "gpp-publicatiebank.nginxSelectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-publicatiebank.nginxName" . }}
{{- end }}