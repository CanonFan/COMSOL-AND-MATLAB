clear;
clc ;
lambda=[500:1:2000]*1e-9;
theta = [0:0.1:60]*pi/180;
for m = 1:length(theta)
    m;
    for n = 1:length(lambda)
        n
%
% MATLAB_v52_2D_E.m
%
% Model exported on Jan 16 2026, 17:06 by COMSOL 5.2.1.152.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath(['E:\02-' native2unicode(hex2dec({'4e' 'ff'}), 'unicode')  native2unicode(hex2dec({'77' '1f'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode') '\14-' native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'4e' '2d'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'54' '38'}), 'unicode')  native2unicode(hex2dec({'65' '36'}), 'unicode')  native2unicode(hex2dec({'73' '87'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode') ]);

model.label(['02-Hanson' native2unicode(hex2dec({'6a' '21'}), 'unicode')  native2unicode(hex2dec({'57' '8b'}), 'unicode') '-2D-v5.2-MATLAB.mph']);

model.comments(['Untitled\n\n']);

model.param.set('f0', 'c_const/lambda');
model.param.set('lambda', lambda(n));
model.param.set('vF', '1E6[m/s]');
model.param.set('Ef', '0.05[eV]');
model.param.set('h_bar', 'h_const/(2*pi)');
model.param.set('epsilon0', '8.854e-12[F/m]');
model.param.set('miu', '10000[cm^2/(V*s)]');
model.param.set('d0', '0.34[nm]');
model.param.set('miuc', 'Ef');
model.param.set('tao', 'miu*Ef/(e_const*vF^2)');
model.param.set('gamma', '1/(2*tao)*2*pi');
model.param.set('T', '300[K]');
model.param.set('kT', 'kB*T');
model.param.set('kB', '1.38e-23[J/K]');
model.param.set('omega', '2*pi*f0');
model.param.set('sigma_intra', '-1i*e_const^2/(pi*h_bar^2*(omega+1i*2*gamma))*(-2*kB*T)*log(2*cosh(miuc/(2*kB*T)))');
model.param.set('sigma_inter', '1i*e_const^2/(4*pi*h_bar)*log(x1/x2)');
model.param.set('x1', '2*abs(miuc)-(omega+2i*gamma)*h_bar');
model.param.set('x2', '2*abs(miuc)+(omega+2i*gamma)*h_bar');
model.param.set('sigma', 'sigma_inter+sigma_intra');
model.param.set('epsilon_gr', '1-1i*sigma/(omega*epsilon0*d0)');
model.param.set('pe', '300[nm]');
model.param.set('h_air', '3[um]');
model.param.set('theta', theta(m));

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').label('AIR');
model.geom('geom1').feature('r1').set('size', {'pe' 'h_air'});
model.geom('geom1').feature('r1').set('pos', {'-pe/2' '-h_air/2'});
model.geom('geom1').create('r2', 'Rectangle');
model.geom('geom1').feature('r2').label('Graphene');
model.geom('geom1').feature('r2').set('size', {'pe' 'd0'});
model.geom('geom1').feature('r2').set('pos', {'-pe/2' '0'});
model.geom('geom1').run;
model.geom('geom1').run('fin');

model.selection.create('emw_dst_pc1', 'Explicit');
model.selection('emw_dst_pc1').label('Destination selection for ''Periodic Condition 1 (emw)''');

model.material.create('mat1', 'Common', 'comp1');
model.material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');

model.physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.physics('emw').create('wee2', 'WaveEquationElectric', 2);
model.physics('emw').feature('wee2').selection.set([2]);
model.physics('emw').create('port1', 'Port', 1);
model.physics('emw').feature('port1').selection.set([7]);
model.physics('emw').feature('port1').create('dport1', 'DiffractionOrder', 1);
model.physics('emw').feature('port1').create('dport2', 'DiffractionOrder', 1);
model.physics('emw').create('port2', 'Port', 1);
model.physics('emw').feature('port2').selection.set([2]);
model.physics('emw').feature('port2').create('dport1', 'DiffractionOrder', 1);
model.physics('emw').feature('port2').create('dport2', 'DiffractionOrder', 1);
model.physics('emw').create('pc1', 'PeriodicCondition', 1);
model.physics('emw').feature('pc1').selection.set([1 3 5 8 9 10]);

model.mesh('mesh1').create('edg1', 'Edge');
model.mesh('mesh1').create('map1', 'Map');
model.mesh('mesh1').create('edg2', 'Edge');
model.mesh('mesh1').create('cpe1', 'CopyEdge');
model.mesh('mesh1').create('ftri1', 'FreeTri');
model.mesh('mesh1').feature('edg1').selection.set([6]);
model.mesh('mesh1').feature('edg1').create('size1', 'Size');
model.mesh('mesh1').feature('map1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('map1').selection.set([2]);
model.mesh('mesh1').feature('map1').create('dis1', 'Distribution');
model.mesh('mesh1').feature('map1').feature('dis1').selection.set([3]);
model.mesh('mesh1').feature('edg2').selection.set([1 5]);
model.mesh('mesh1').feature('edg2').create('size1', 'Size');
model.mesh('mesh1').feature('ftri1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('ftri1').selection.set([1 3]);
model.mesh('mesh1').feature('ftri1').create('size1', 'Size');

model.view('view1').axis.set('abstractviewrratio', '4.176328659057617');
model.view('view1').axis.set('abstractviewlratio', '-4.176328659057617');
model.view('view1').axis.set('abstractviewxscale', '3.985507479598027E-9');
model.view('view1').axis.set('abstractviewbratio', '-0.05000000074505806');
model.view('view1').axis.set('xmax', '1.045073759087245E-6');
model.view('view1').axis.set('xmin', '-1.045073759087245E-6');
model.view('view1').axis.set('abstractviewyscale', '3.985507479598027E-9');
model.view('view1').axis.set('ymax', '1.575000055709097E-6');
model.view('view1').axis.set('ymin', '-1.575000055709097E-6');
model.view('view1').axis.set('abstractviewtratio', '0.05000000074505806');

model.material('mat1').propertyGroup('RefractiveIndex').set('n', '');
model.material('mat1').propertyGroup('RefractiveIndex').set('ki', '');
model.material('mat1').propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});

model.physics('emw').feature('wee1').set('DisplacementFieldModel', 'RefractiveIndex');
model.physics('emw').feature('wee2').set('epsilonr', {'epsilon_gr'; '0'; '0'; '0'; '1'; '0'; '0'; '0'; 'epsilon_gr'});
model.physics('emw').feature('port1').set('PortExcitation', 'on');
model.physics('emw').feature('port1').set('PortType', 'Periodic');
model.physics('emw').feature('port1').set('Hampl', {'0'; '0'; '1'});
model.physics('emw').feature('port1').set('alpha_inc', 'theta');
model.physics('emw').feature('port1').set('fmax', 'c_const/300[nm]');
model.physics('emw').feature('port1').feature('dport1').set('mOrder', '-1');
model.physics('emw').feature('port1').feature('dport2').set('components', 'outofplane');
model.physics('emw').feature('port1').feature('dport2').set('mOrder', '-1');
model.physics('emw').feature('port2').set('PortType', 'Periodic');
model.physics('emw').feature('port2').set('Hampl', {'0'; '0'; '1'});
model.physics('emw').feature('port2').set('alpha_inc', 'theta');
model.physics('emw').feature('port2').set('fmax', 'c_const/300[nm]');
model.physics('emw').feature('port2').feature('dport1').set('mOrder', '-1');
model.physics('emw').feature('port2').feature('dport2').set('components', 'outofplane');
model.physics('emw').feature('port2').feature('dport2').set('mOrder', '-1');
model.physics('emw').feature('pc1').set('PeriodicType', 'Floquet');
model.physics('emw').feature('pc1').set('Floquet_source', 'FromPeriodicPort');

model.mesh('mesh1').feature('edg1').feature('size1').set('custom', 'on');
model.mesh('mesh1').feature('edg1').feature('size1').set('hmaxactive', true);
model.mesh('mesh1').feature('edg1').feature('size1').set('hmax', '10[nm]');
model.mesh('mesh1').feature('edg2').feature('size1').set('custom', 'on');
model.mesh('mesh1').feature('edg2').feature('size1').set('hmaxactive', true);
model.mesh('mesh1').feature('edg2').feature('size1').set('hmax', '50[nm]');
model.mesh('mesh1').feature('cpe1').selection('source').set([1 5]);
model.mesh('mesh1').feature('cpe1').selection('destination').set([8 10]);
model.mesh('mesh1').feature('ftri1').feature('size1').set('custom', 'on');
model.mesh('mesh1').feature('ftri1').feature('size1').set('hmaxactive', true);
model.mesh('mesh1').feature('ftri1').feature('size1').set('hmax', '50[nm]');
model.mesh('mesh1').run;

model.physics('emw').feature('wee2').set('epsilonr_mat', 'userdef');
model.physics('emw').feature('wee2').set('mur_mat', 'userdef');
model.physics('emw').feature('wee2').set('sigma_mat', 'userdef');

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.numerical.create('gev1', 'EvalGlobal');
model.result.numerical.create('gev2', 'EvalGlobal');
model.result.numerical.create('gev3', 'EvalGlobal');
model.result.numerical.create('gev4', 'EvalGlobal');
model.result.numerical.create('gev5', 'EvalGlobal');
model.result.numerical.create('gev6', 'EvalGlobal');
model.result.numerical('gev1').set('probetag', 'none');
model.result.numerical('gev2').set('probetag', 'none');
model.result.numerical('gev3').set('probetag', 'none');
model.result.numerical('gev4').set('probetag', 'none');
model.result.numerical('gev5').set('probetag', 'none');
model.result.numerical('gev6').set('probetag', 'none');
model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').create('surf1', 'Surface');

model.study('std1').feature('freq').set('plist', 'f0');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('v1').set('clist', {'f0'});
model.sol('sol1').feature('v1').set('cname', {'freq'});
model.sol('sol1').feature('v1').set('clistctrl', {'p1'});
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'f0'});
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').runAll;


out1(n,m) = mphint2(model,'emw.Qrh','surface','selection',[2],'dataset','dset1');

    end
  
end

fname=['TE_GRAPHENE_0_60.txt'];
save(fname,'out1','-ascii','-double');