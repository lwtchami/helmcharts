{{/*
Spec du pod partagée entre le CronJob et le Job d'initialisation.
Utilisée avec {{ include "ecr-refresh.podSpec" . }}
*/}}
{{- define "ecr-refresh.podSpec" -}}
restartPolicy: {{ .restartPolicy }}
serviceAccountName: ecr-refresher
dnsPolicy: ClusterFirst
terminationGracePeriodSeconds: 30
volumes:
  - name: ecr-script
    configMap:
      name: {{ .Release.Name }}-ecr-refresh-script
      defaultMode: 0755
containers:
  - name: ecr-refresh
    image: amazon/aws-cli:latest
    imagePullPolicy: {{ .Values.image.pullPolicy }}
    envFrom:
      - secretRef:
          name: aws-ecr-creds
    command:
      - /bin/sh
      - /scripts/refresh.sh
    volumeMounts:
      - name: ecr-script
        mountPath: /scripts
    resources: {}
{{- end }}