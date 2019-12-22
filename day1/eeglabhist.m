% EEGLAB history file generated on the 21-Dec-2019
% ------------------------------------------------

% 显示eeglab版本号 
EEG.etc.eeglabvers = '2019.1'; % this tracks which version of EEGLAB is being used, you may ignore it

% 读取eeg数据
EEG = pop_loadbv('D:\EEG_learning\基础班\夏晓磊\test_data\', '12.1.vhdr', [1 919280], [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63]);
EEG = eeg_checkset( EEG ); % 检查数据中的基本信息
EEG=pop_chanedit(EEG, 'lookup','C:\\Users\\eXrld\\Documents\\MATLAB\\eeglab2019_1\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp');
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG, 'nochannel',{'TP9' 'TP10' 'HEOG'});
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_reref( EEG, 31,'keepref','on');
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1); % 低通滤波，去掉低于1Hz的波
EEG = eeg_checkset( EEG );
EEG = pop_eegfiltnew(EEG, 'hicutoff',30,'plotfreqz',1); % 高通滤波，去掉高于30的波
EEG = eeg_checkset( EEG );

% 根据以下成分进行分段
EEG = pop_epoch( EEG, {  'S 14'  'S 18'  'S 22'  'S 26'  'S 30'  'S 34'  'S 38'  'S 42'  'S 46'  'S 50'  'S 54'  'S 58'  'S 62'  'S 66'  'S114'  'S118'  'S122'  'S126'  'S130'  'S134'  'S138'  'S142'  'S146'  'S150'  'S154'  'S158'  'S162'  'S166'  }, [-1  2], 'epochinfo', 'yes');
EEG = eeg_checkset( EEG );

% 按照该范围进行基线校准
EEG = pop_rmbase( EEG, [-1000 0] ,[]);
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );

%% 进行 ica 分析
EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on','pca',59);
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = eeg_checkset( EEG );
EEG = pop_rejepoch( EEG, [1 2] ,0);
EEG = pop_interp(EEG, [17  47], 'spherical');
EEG = eeg_checkset( EEG );
pop_selectcomps(EEG, [1:59] );
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_subcomp( EEG, [1], 0);
EEG = eeg_checkset( EEG );

% 保存分析后的数据
EEG = pop_saveset( EEG, 'filename','12.1.preprocessed.set','filepath','D:\\EEG_learning\\基础班\\夏晓磊\\test_data\\');
EEG = eeg_checkset( EEG );
