import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
    stages: [
        { duration: '30s', target: 50000 },
        { duration: '1m', target: 50000 },
        { duration: '30s', target: 0 }
    ]
};

const pollPaas = 'http://48.217.213.128/';
const pollIaas = 'http://poll-vm-terracloud.westus.cloudapp.azure.com:5000/';
const resultPaas = 'http://172.212.66.107/';
const resultIaas = 'http://result-vm-terracloud.westus.cloudapp.azure.com:5001/';
export default function () {
    const formData = `vote=${['a', 'b', 'c','d'][Math.floor(Math.random() * ['a', 'b', 'c','d'].length)]}`;

    let pollPaasResult = http.get(pollPaas);
    check(pollPaasResult, {
        'Poll PaaS: Status 200': (r) => r.status === 200,
        'Poll PaaS: Response time < 200ms': (r) => r.timings.duration < 200,
    });

    let pollIaasResult = http.get(pollIaas);
    check(pollIaasResult, {
        'Poll IaaS: Status 200': (r) => r.status === 200,
        'Poll IaaS: Response time < 200ms': (r) => r.timings.duration < 200,
    });

    let pollPaasRequestResult = http.post(pollPaas, formData, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });
    check(pollPaasRequestResult, {
        'Poll PaaS Request: Status 200': (r) => r.status === 200,
        'Poll PaaS Request: Response time < 200ms': (r) => r.timings.duration < 200,
    });

    let pollIaasRequestResult = http.post(pollIaas, formData, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });
    check(pollIaasRequestResult, {
        'Poll IaaS Request: Status 200': (r) => r.status === 200,
        'Poll IaaS Request: Response time < 200ms': (r) => r.timings.duration < 200,
    });

    let resultPaasResult = http.get(resultPaas);
    check(resultPaasResult, {
        'Poll PaaS: Status 200': (r) => r.status === 200,
        'Poll PaaS: Response time < 200ms': (r) => r.timings.duration < 200,
    });

    let resultIaasResult = http.get(resultIaas);
    check(resultIaasResult, {
        'Poll IaaS: Status 200': (r) => r.status === 200,
        'Poll IaaS: Response time < 200ms': (r) => r.timings.duration < 200,
    });

    sleep(1);
}