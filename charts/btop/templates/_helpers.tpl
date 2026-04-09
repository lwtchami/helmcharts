
{{- define "btop.header" -}}
namespace: {{ .Release.Namespace }}
name: btop-{{ .Release.Name }}
labels:
  app: btop-{{ .Release.Name }}
{{- end }}

