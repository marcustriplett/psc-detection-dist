alex_l23_pyr = get_sweeps('/home/shababo/projects/mapping/code/psc-detection/data/for-paper/epscs/L5andL23PC_data_spontaneous/20141016/20141016ExpA.mat',1,1,0);
som_0612_trace = get_sweeps('/home/shababo/projects/mapping/code/psc-detection/data/for-paper/epscs/som/0612_som01.mat',1,3,0);
alan_emx = get_sweeps('/home/shababo/projects/mapping/code/psc-detection/data/for-paper/ipscs/EMX/20150706_AM2F_TI1_cell6-7.mat',1,5,0);

figure;
subplot(311)
plot(alex_l23_pyr)
subplot(312)
plot(som_0612_trace);
subplot(313)
plot(alan_emx)

%%
load('data/for-paper/real_noise_traces_longer.mat')
experiment = '0000';
load(['longer-noise-examples-epscs-' experiment '.mat']);


phi_ar2_noise_01 = results(1).trials.phi{results(1).map_ind};
phi_ar2_noise_02 = results(2).trials.phi{results(2).map_ind};
sigmasq_ar2_noise_01 = results(1).trials.noise{results(1).map_ind};
sigmasq_ar2_noise_02 = results(2).trials.noise{results(2).map_ind};

load(['longer-noise-examples-ipscs-' experiment '.mat']);

phi_ar2_noise_03 = results(1).trials.phi{results(1).map_ind};
sigmasq_ar2_noise_03 = results(1).trials.noise{results(1).map_ind};
sim_data = zeros(3,2000);
phi = phi_ar2_noise_01; sigmasq = sigmasq_ar2_noise_01; simulate_data; sim_data(1,:) = traces;
phi = phi_ar2_noise_02; sigmasq = sigmasq_ar2_noise_02; simulate_data; sim_data(2,:) = traces;
phi = phi_ar2_noise_03; sigmasq = sigmasq_ar2_noise_03; simulate_data; sim_data(3,:) = traces;
%%
experiment = '1000';
load(['longer-noise-examples-epscs-' experiment '.mat']);


phi_ar0_noise_01 = results(1).trials.phi{results(1).map_ind};
phi_ar0_noise_02 = results(2).trials.phi{results(2).map_ind};
sigmasq_ar0_noise_01 = results(1).trials.noise{results(1).map_ind};
sigmasq_ar0_noise_02 = results(2).trials.noise{results(2).map_ind};

load(['longer-noise-examples-ipscs-' experiment '.mat']);

phi_ar0_noise_03 = results(1).trials.phi{results(1).map_ind};
sigmasq_ar0_noise_03 = results(1).trials.noise{results(1).map_ind};
sim_ar0_data = zeros(3,2000);
phi = phi_ar0_noise_01; sigmasq = sigmasq_ar0_noise_01; simulate_data; sim_ar0_data(1,:) = traces;
phi = phi_ar0_noise_02; sigmasq = sigmasq_ar0_noise_02; simulate_data; sim_ar0_data(2,:) = traces;
phi = phi_ar0_noise_03; sigmasq = sigmasq_ar0_noise_03; simulate_data; sim_ar0_data(3,:) = traces;

%%
figure;
subplot(131)
plot_trace_stack(real_noise_traces_longer(:,6001:8000),20,zeros(3,3),'-',[.010 10])
title('Voltage Clamp Recordings')

subplot(132)
plot_trace_stack(sim_ar0_data,20,zeros(3,3),'-',[.010 10])
title('Simulated Noise From Fits - AR(0)')

subplot(133)
plot_trace_stack(sim_data,20,zeros(3,3),'-',[.010 10])
title('Simulated Noise From Fits - AR(2)')

%%
load('data/good-example-trace-0003.mat')


phi = results(1).trials.phi{results(1).map_ind};
sigmasq = results(1).trials.noise{results(1).map_ind};
simulate_data; sim_ar0_data = traces;

% load('data/good-example-trace-0003.mat')


phi = results(1).trials.phi{results(1).map_ind};
sigmasq = results(1).trials.noise{results(1).map_ind};
simulate_data; sim_ar2_data = traces;
load('data/for-paper/good-example-trace.mat')
traces_to_plot = [traces(1:length(sim_ar0_data)); sim_ar0_data; sim_ar2_data];

figure;
plot_trace_stack(traces_to_plot,20,zeros(3,3),'-',[.010 10])

