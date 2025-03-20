{{/*
Expand the name gpp-zoeken the chart.
*/}}
{{- define "gpp-zoeken.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gpp-zoeken.fullname" -}}
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
{{- define "gpp-zoeken.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "gpp-zoeken.commonLabels" -}}
helm.sh/chart: {{ include "gpp-zoeken.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
gpp-zoeken labels
*/}}
{{- define "gpp-zoeken.labels" -}}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{ include "gpp-zoeken.commonLabels" . }}
{{ include "gpp-zoeken.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "gpp-zoeken.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-zoeken.name" . }}
{{- end }}

{{/*
Create a name for the worker
We truncate at 56 chars in order to provide space for the "-worker" suffix
*/}}
{{- define "gpp-zoeken.workerName" -}}
{{ include "gpp-zoeken.name" . | trunc 56 | trimSuffix "-" }}-worker
{{- end }}

{{/*
Create a default fully qualified name for the worker.
We truncate at 56 chars in order to provide space for the "-worker" suffix
*/}}
{{- define "gpp-zoeken.workerFullname" -}}
{{ include "gpp-zoeken.fullname" . | trunc 56 | trimSuffix "-" }}-worker
{{- end }}

{{/*
Worker labels
*/}}
{{- define "gpp-zoeken.workerLabels" -}}
{{ include "gpp-zoeken.commonLabels" . }}
{{ include "gpp-zoeken.workerSelectorLabels" . }}
{{- end }}

{{/*
Worker selector labels
*/}}
{{- define "gpp-zoeken.workerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-zoeken.workerName" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "gpp-zoeken.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "gpp-zoeken.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Ingress annotations
*/}}
{{- define "gpp-zoeken.ingress.annotations" -}}
  {{- range $key, $val := .Values.ingress.annotations }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
{{- end }}

{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "gpp-zoeken.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "gpp-zoeken.tplvalues.render" -}}
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
{{- define "gpp-zoeken.nginxName" -}}
{{ include "gpp-zoeken.name" . | trunc 57 | trimSuffix "-" }}-nginx
{{- end }}

{{/*
Create a default fully qualified name for NGINX.
We truncate at 57 chars in order to provide space for the "-nginx" suffix
*/}}
{{- define "gpp-zoeken.nginxFullname" -}}
{{ include "gpp-zoeken.fullname" . | trunc 57 | trimSuffix "-" }}-nginx
{{- end }}

{{/*
NGINX labels
*/}}
{{- define "gpp-zoeken.nginxLabels" -}}
{{ include "gpp-zoeken.commonLabels" . }}
{{ include "gpp-zoeken.nginxSelectorLabels" . }}
{{- end }}

{{/*
NGINX selector labels
*/}}
{{- define "gpp-zoeken.nginxSelectorLabels" -}}
app.kubernetes.io/name: {{ include "gpp-zoeken.nginxName" . }}
{{- end }}