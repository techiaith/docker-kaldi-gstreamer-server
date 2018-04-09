
build:
	docker build -t techiaith/kaldi-gstreamer-server .


run:
	mkdir -p ${PWD}/models/$(model)/log
	$(eval REFERENCE_FILE = ${PWD}/models/$(model)/log/reference-content.json)
	touch $(REFERENCE_FILE)
	docker run --name kaldi-server-$(model) --restart=always \
		-d -p $(port):80 \
		-v ${PWD}/models/$(model)/:/opt/model \
		-v ${PWD}/models/$(model)/log:/opt/tmp \
		-v $(REFERENCE_FILE):/opt/reference-content.json \
		techiaith/kaldi-gstreamer-server \
		bash -c "cd /opt && ./start.sh -y model/$(model).yaml"


add-worker:
	docker run --name kaldi-worker-$(model)-$(worker) --restart=always \
 		-d \
		--link kaldi-server-$(model):master \
		-v ${PWD}/models/$(model)/:/opt/model \
		techiaith/kaldi-gstreamer-server \
		bash -c "cd /opt && ./start.sh -y model/$(model)/$(model).yaml -m master"

		
stop:
	docker stop kaldi-server-$(model)
	docker rm kaldi-server-$(model)


stop-worker:
	docker stop kaldi-worker-$(model)-$(worker)
	docker rm kaldi-worker-$(model)-$(worker)


clean:
	docker rmi techiaith/kaldi-gstreamer-server

