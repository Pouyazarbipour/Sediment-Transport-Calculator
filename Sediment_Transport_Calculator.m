%% POUYA ZARBIPOUR LAKPOSHTEH EMAIL: pouyazarbipour@gmail.com

classdef Sediment_Transport_Calculator < handle
    properties
        % UI Components
        figure
        inputPanel
        outputPanel
        HinField
        angle0Field
        KinField
        BinField
        hstarinField
        qoutField
        qyoutField
        GoutField
    end
    
    methods
        % Constructor
        function obj = Sediment_Transport_Calculator()
            obj.createElements();
        end
        
        % Create GUI Components
        function createElements(obj)
            % Create main figure
            obj.figure = uifigure('Name', 'Sediment_Transport_Calculator', ...
                                  'Position', [100, 100, 700, 400]);
            
            % Input Panel
            obj.inputPanel = uipanel(obj.figure, ...
                                     'Title', 'Input Values', ...
                                     'Position', [25, 120, 300, 250]);
            
            % Output Panel
            obj.outputPanel = uipanel(obj.figure, ...
                                      'Title', 'Output Values', ...
                                      'Position', [375, 120, 300, 250]);
            
            % Input Fields and Labels
            uilabel(obj.inputPanel, 'Text', 'Breaker Height (m):', ...
                    'Position', [10, 190, 150, 20]);
            obj.HinField = uieditfield(obj.inputPanel, 'numeric', ...
                                       'Value', 0.5, ...
                                       'Position', [160, 190, 100, 22]);
            
            uilabel(obj.inputPanel, 'Text', 'Breaking Angle (°):', ...
                    'Position', [10, 150, 150, 20]);
            obj.angle0Field = uieditfield(obj.inputPanel, 'numeric', ...
                                          'Value', 10, ...
                                          'Position', [160, 150, 100, 22]);
            
            uilabel(obj.inputPanel, 'Text', 'K:', ...
                    'Position', [10, 110, 150, 20]);
            obj.KinField = uieditfield(obj.inputPanel, 'numeric', ...
                                       'Value', 0.7, ...
                                       'Position', [160, 110, 100, 22]);
            
            uilabel(obj.inputPanel, 'Text', 'Berm Height, B (m):', ...
                    'Position', [10, 70, 150, 20]);
            obj.BinField = uieditfield(obj.inputPanel, 'numeric', ...
                                       'Value', 1.0, ...
                                       'Position', [160, 70, 100, 22]);
            
            uilabel(obj.inputPanel, 'Text', 'Depth of Closure (m):', ...
                    'Position', [10, 30, 150, 20]);
            obj.hstarinField = uieditfield(obj.inputPanel, 'numeric', ...
                                           'Value', 6.0, ...
                                           'Position', [160, 30, 100, 22]);
            
            % Buttons
            uibutton(obj.inputPanel, 'Text', 'Calculate', ...
                     'Position', [40, -10, 100, 30], ...
                     'ButtonPushedFcn', @(~, ~) obj.calculate());
                 
            uibutton(obj.inputPanel, 'Text', 'Reset', ...
                     'Position', [160, -10, 100, 30], ...
                     'ButtonPushedFcn', @(~, ~) obj.reset());
            
            % Output Fields and Labels
            uilabel(obj.outputPanel, 'Text', 'Q (m³/s):', ...
                    'Position', [10, 190, 150, 20]);
            obj.qoutField = uieditfield(obj.outputPanel, 'numeric', ...
                                        'Editable', 'off', ...
                                        'Position', [160, 190, 100, 22]);
            
            uilabel(obj.outputPanel, 'Text', 'Q (m³/yr):', ...
                    'Position', [10, 150, 150, 20]);
            obj.qyoutField = uieditfield(obj.outputPanel, 'numeric', ...
                                         'Editable', 'off', ...
                                         'Position', [160, 150, 100, 22]);
            
            uilabel(obj.outputPanel, 'Text', 'G (m²/s):', ...
                    'Position', [10, 110, 150, 20]);
            obj.GoutField = uieditfield(obj.outputPanel, 'numeric', ...
                                        'Editable', 'off', ...
                                        'Position', [160, 110, 100, 22]);
        end
        
        % Calculation Logic
        function calculate(obj)
            % Constants
            g = 9.81; % Gravity (m/s^2)
            rho = 1000; % Water density (kg/m^3)
            s = 2.65; % Relative density
            p = 0.3; % Porosity
            kappa = 0.78; % Breaker parameter
            
            try
                % Inputs
                Hb = obj.HinField.Value; % Breaker height (m)
                theta_b = deg2rad(obj.angle0Field.Value); % Breaking angle (radians)
                K = obj.KinField.Value; % K
                B = obj.BinField.Value; % Berm height (m)
                h_star = obj.hstarinField.Value; % Depth of closure (m)
                
                % Calculations
                db = Hb / kappa;
                Eb = (rho * g * Hb^2) / 8;
                Cb = sqrt(g * db);
                Cq = (K * Eb * Cb) / (rho * g * (s - 1) * (1 - p));
                
                % Sediment transport rate Q (m³/s)
                Q = Cq * cos(theta_b) * sin(theta_b);
                Q = round(Q, 3);
                obj.qoutField.Value = Q;
                
                % Sediment transport rate Q (m³/yr)
                Qy = Q * 31536000; % Seconds in a year
                Qy = round(Qy, 2);
                obj.qyoutField.Value = Qy;
                
                % Longshore transport rate G (m²/s)
                G = (2 * Cq * cos(2 * theta_b)) / (h_star + B);
                G = round(G, 3);
                obj.GoutField.Value = G;
            catch
                uialert(obj.figure, 'Please enter valid values.', 'Error');
            end
        end
        
        % Reset Functionality
        function reset(obj)
            % Reset input fields
            obj.HinField.Value = 0.5;
            obj.angle0Field.Value = 10;
            obj.KinField.Value = 0.7;
            obj.BinField.Value = 1.0;
            obj.hstarinField.Value = 6.0;
            
            % Reset output fields
            obj.qoutField.Value = [];
            obj.qyoutField.Value = [];
            obj.GoutField.Value = [];
        end
    end
end
