{{- define "jyga-minio.fullname" -}}
{{ .Release.Name }}-minio
{{- end }}

{{/*
  Vérifie que la StorageClass requise existe sur le cluster.
  Échoue le rendu si elle est absente, forçant un message d'erreur clair.
*/}}
{{- define "jyga-minio.assertStorageClass" -}}
  {{- $sc := lookup "storage.k8s.io/v1" "StorageClass" "" .Values.persistence.storageClass -}}
  {{- if not $sc -}}
    {{- fail (printf "StorageClass '%s' introuvable. Déployez jyga-base d'abord (helm install jyga-base ou vérifiez le label Fleet 'Base: 0.1.0' sur le cluster)." .Values.persistence.storageClass) -}}
  {{- end -}}
{{- end -}}