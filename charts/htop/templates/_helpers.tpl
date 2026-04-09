
{{- define "htop.header" -}}
namespace: {{ .Release.Namespace }}
name: htop-{{ .Release.Name }}
labels:
  app: htop-{{ .Release.Name }}
{{- end }}

